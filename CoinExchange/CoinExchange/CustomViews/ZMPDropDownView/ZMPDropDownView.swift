//
//  ZMPDropDownView.swift
//  CoinExchange
//
//  Created by Zin Min Phyo on 04/09/2022.
//

import UIKit

class ZMPDropDownView: UIView {
    
    private var tableView: UITableView!
    private var bgView: UIView!
    private var containerView: UIView!
    private var shadowLayer: CAShapeLayer!
    private let cellHeight: CGFloat = 50.0
    private let cornerRadius: CGFloat = 10
    
    
    var dataSource: ZMPDropDownViewDataSource?
    var delegate: ZMPDropDownViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureHierarchy()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableView.layer.cornerRadius = cornerRadius
        bgView.layer.cornerRadius = cornerRadius
    }
    
    private func configureHierarchy() {
        configureContainerView()
        configureTableView()
        configureShadowLayer()
        configureBackgroundView()
    }
    
    private func configureContainerView() {
        containerView = UIView()
        
        containerView.backgroundColor = UIColor.clear
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapContainerView))
        containerView.addGestureRecognizer(tapGesture)
    }
    
    private func configureTableView() {
        tableView = UITableView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.white
        tableView.bounces = false
        tableView.delegate = self
    }
    
    private func configureShadowLayer() {
        shadowLayer = CAShapeLayer()
        shadowLayer.shadowColor = UIColor.darkGray.cgColor
        shadowLayer.fillColor = UIColor.clear.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0.3, height: 0.3)
        shadowLayer.shadowRadius = 1
        shadowLayer.shadowOpacity = 0.8
    }
    
    private func configureBackgroundView() {
        bgView = UIView()
    }
    
    @objc func tapContainerView() {
        hideDropDown()
    }
    
    func showDropDown() {
        
        let convertedPoint = getConvertedPoint(self, baseView: topController?.view)
        tableView.frame = CGRect(x: convertedPoint.x , y: convertedPoint.y + self.bounds.height, width: self.bounds.width, height: cellHeight * CGFloat(3) )
        
        bgView.frame = tableView.frame
        containerView.frame = topController?.view.bounds ?? .zero
        let path = UIBezierPath(roundedRect: bgView.bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.path = path
        shadowLayer.shadowPath = path
        
        bgView.layer.insertSublayer(shadowLayer, at: 0)
        
        tableView.reloadData()
        topController?.view.addSubview(containerView)
        topController?.view.addSubview(bgView)
        topController?.view.addSubview(tableView)
    }
    
    func hideDropDown() {
        tableView.removeFromSuperview()
        bgView.removeFromSuperview()
        containerView.removeFromSuperview()
    }
    

}


extension ZMPDropDownView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.numberOfItem(in: self) ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource?.dataForItem(at: indexPath.row).getTitle() ?? ""
        cell.contentView.backgroundColor = .white
        cell.selectionStyle = .none
        return cell
    }
}


extension ZMPDropDownView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectItem(at: indexPath.row, in: self)
        hideDropDown()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}


extension ZMPDropDownView {
    
    var topController: UIViewController? {
        var nextResponder: UIResponder? = self
        while nextResponder != nil {
            nextResponder = nextResponder?.next
            if let vc = nextResponder as? UIViewController {
                return vc
            }
        }
        return nil
    }
    
    func getConvertedPoint(_ targetView: UIView, baseView: UIView?)->CGPoint{
        var pnt = targetView.frame.origin
        if nil == targetView.superview{
            return pnt
        }
        var superView = targetView.superview
        while superView != baseView{
            pnt = superView!.convert(pnt, to: superView!.superview)
            if nil == superView!.superview{
                break
            }else{
                superView = superView!.superview
            }
        }
        return superView!.convert(pnt, to: baseView)
    }
}
